# sync_usb_kernel

This repository contains kernel stuff needed by sync_usb. This
includes patches as well as some pre-built Ubuntu kernels.

See also these mailing list threads for more information about why
the patching is necessary:
 - http://marc.info/?l=linux-usb&m=135465493510190
 - http://marc.info/?l=linux-usb&m=136119974525550

## Security/Compiling from source
Caution: the binary images may contain known vulnerabilities! Better
apply (and possibly rebase) the patches to up-to-date sources and
build the kernels yourself. You can do that by fetching the kernel
sources, applying the respective patch and calling the included
rebuild-ubuntu-packages.sh script from within the kernel source
directory. The .deb files will be located in the parent directory.

## Testing
After installing the debs and rebooting into the respective kernel
one can test correct functioning of the patch by issuing:

	find /sys/ -name "frame_number" -printf "%p: " -exec cat "{}" \;

This looks for the virtual files created by the patch, reads and
prints their content that represents the current frame number of the
respective bus/root hub, or an error condition if the value is
negative. -108 (ESHUTDOWN) is known to happen on some systems while
no devices are attached to the bus.
