#!/bin/bash

VM_NAME="win10"
VIEWER_URL="spice://localhost:5900"

start_vm() {
    local state
    state=$(virsh domstate "$VM_NAME")

    if [[ "$state" == "paused" ]]; then
        printf "Virtual machine %s is paused. Unpausing...\n" "$VM_NAME"
        if ! virsh resume "$VM_NAME"; then
            printf "Failed to unpause the virtual machine %s\n" "$VM_NAME" >&2
            return 1
        fi
    elif [[ "$state" != "running" ]]; then
        printf "Starting the virtual machine %s...\n" "$VM_NAME"
        if ! virsh start "$VM_NAME"; then
            printf "Failed to start the virtual machine %s\n" "$VM_NAME" >&2
            return 1
        fi
    else
        printf "Virtual machine %s is already running.\n" "$VM_NAME"
    fi
}

stop_vm() {
    printf "Suspending the virtual machine %s...\n" "$VM_NAME"
    if ! virsh suspend "$VM_NAME"; then
        printf "Failed to suspend the virtual machine %s\n" "$VM_NAME" >&2
        return 1
    fi
}

trap stop_vm EXIT

main() {
    if ! start_vm; then
        printf "Error starting the virtual machine. Exiting...\n" >&2
        exit 1
    fi

    printf "Opening viewer for the virtual machine %s...\n" "$VM_NAME"
    if ! remote-viewer "$VIEWER_URL"; then
        printf "Failed to open the viewer for the virtual machine %s\n" "$VM_NAME" >&2
        exit 1
    fi
}

main "$@"