# Windows

Download [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run setup and leave the default settings. At "Select Packages", choose to install the following:

- `make`
- `git`
- `gcc-core`

Then download [**rgbds 0.5.2**](https://github.com/gbdev/rgbds/releases/tag/v0.5.2). Extract it and put all the `exe` and `dll` files individually in **C:\cygwin64\usr\local\bin**.

In the **Cygwin terminal**, enter these commands:

	git clone https://github.com/erosunica/Gold97SGB-es
	cd Gold97SGB-es

To build **pokegold97-es.gbc**:

	make


# Mac OS X

Get [**Homebrew**](http://brew.sh/).

Then in **Terminal**, run:

	xcode-select --install
	brew install rgbds

	git clone https://github.com/erosunica/Gold97SGB-es
	cd Gold97SGB-es

To build **pokegold97-es.gbc**:

	make


# Linux

	sudo apt-get install make git gcc

	sudo apt-get install bison pkg-config libpng-dev
	git clone https://github.com/gbdev/rgbds
	cd rgbds
	sudo make install
	cd ..

	git clone https://github.com/erosunica/Gold97SGB-es
	cd Gold97SGB-es

To build **pokegold97-es.gbc**:

	make
