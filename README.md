# oily-gentoo

For now, oily-gentoo defines a minimal and automated path to replace /bin/bash and /bin/sh with [oilshell](https://www.oilshell.org/) in a [stage 3 Gentoo tarball](https://wiki.gentoo.org/wiki/Stage_file#Stage_3).

```sh
# Removes everything
./build clean

# Generate a rootfs
./build rootfs

# Enter a chroot
./build chroot
# Load the profile to have $PATH set, etc.
> . /etc/profile

# Remove mountpoints when finished
./build remove_mounts
```

Idea and most code stolen from https://github.com/JoshMcguigan/cascade
