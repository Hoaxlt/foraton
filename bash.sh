#!/bin/bash

# Настройки
PROCESS_NAME="test"
MONITORING_URL="https://test.com/monitoring/test/api"
LOG_FILE="/var/log/monitoring.log"
TIMEOUT=10  # Таймаут для curl в секундах

# Проверяем, запущен ли процесс
is_process_running() {
    pgrep -x "$PROCESS_NAME" >/dev/null
}

# Проверяем, был ли процесс перезапущен 
check_restart() {
    local current_pid=$(pgrep -x "$PROCESS_NAME")
    
    if [ -f "/tmp/${PROCESS_NAME}_monitor.pid" ]; then
        local previous_pid=$(cat "/tmp/${PROCESS_NAME}_monitor.pid")
        
        if [ "$current_pid" != "$previous_pid" ] && [ -n "$previous_pid" ]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Process $PROCESS_NAME was restarted (old PID: $previous_pid, new PID: $current_pid)" >> "$LOG_FILE"
        fi
    fi
    
    # Сохраняем текущий PID для следующей проверки
    [ -n "$current_pid" ] && echo "$current_pid" > "/tmp/${PROCESS_NAME}_monitor.pid"
}

# Отправляем запрос к серверу мониторинга
ping_monitoring_server() {
    if ! curl -s -k --max-time "$TIMEOUT" "$MONITORING_URL" >/dev/null; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Monitoring server is unreachable: $MONITORING_URL" >> "$LOG_FILE"
        return 1
    fi
    return 0
}


main() {
    if is_process_running; then
        check_restart
        if ! ping_monitoring_server; then
            exit 1
        fi
    fi
}

main
