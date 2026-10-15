if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -z "$XDG_RUNTIME_DIR"
	    set -gx XDG_RUNTIME_DIR "/tmp/"(id -u)"-runtime-dir"
    end
	if test ! -d "$XDG_RUNTIME_DIR"
		    mkdir -p "$XDG_RUNTIME_DIR"
		    chmod 700 "$XDG_RUNTIME_DIR"
	end
	set -gx WLR_RENDERER pixman
	set -gx WLR_NO_HARDWARE_CURSORS 1
	set -gx LIBGL_ALWAYS_SOFTWARE true
    set -gx XDG_SESSION_TYPE wayland
    set -gx XDG_CURRENT_DESKTOP sway
    set -gx MOZ_ENABLE_WAYLAND 1

    if test -z "$WAYLAND_DISPLAY"; and test (tty) = "/dev/tty1"
	    exec dbus-run-session sway
    end
end
