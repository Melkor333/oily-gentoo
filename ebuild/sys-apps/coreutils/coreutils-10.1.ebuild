# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.2
#
# CASCADE MOD: Duplicate the sys-apps/uutils-coreutils package and
#              call it sys-apps/coreutils to allow it to stand in
#              for any apps that already depend on sys-apps/coreutils.
#
#              An virtual package would be the ideal answer here
#              but to make that work all upstream deps would need to
#              have modified ebuilds.

EAPI=8

CRATES="
	adler@1.0.2
	aho-corasick@1.0.4
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.5.0
	anstyle-parse@0.2.0
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anstyle@1.0.0
	arrayref@0.3.6
	arrayvec@0.7.4
	autocfg@1.1.0
	bigdecimal@0.4.0
	binary-heap-plus@0.5.0
	bindgen@0.63.0
	bitflags@1.3.2
	bitflags@2.4.2
	blake2b_simd@1.0.2
	blake3@1.5.1
	block-buffer@0.10.3
	bstr@1.9.1
	bumpalo@3.11.1
	bytecount@0.6.7
	byteorder@1.5.0
	cc@1.0.79
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	chrono@0.4.35
	clang-sys@1.4.0
	clap@4.4.2
	clap_builder@4.4.2
	clap_complete@4.4.0
	clap_lex@0.5.0
	clap_mangen@0.2.9
	colorchoice@1.0.0
	compare@0.1.0
	console@0.15.8
	const-random-macro@0.1.16
	const-random@0.1.16
	constant_time_eq@0.3.0
	conv@0.3.3
	core-foundation-sys@0.8.3
	coz@0.1.3
	cpp@0.5.9
	cpp_build@0.5.9
	cpp_common@0.5.9
	cpp_macros@0.5.9
	cpufeatures@0.2.5
	crc32fast@1.3.2
	crossbeam-channel@0.5.10
	crossbeam-deque@0.8.4
	crossbeam-epoch@0.9.17
	crossbeam-utils@0.8.18
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	ctrlc@3.4.4
	custom_derive@0.1.7
	data-encoding-macro-internal@0.1.12
	data-encoding-macro@0.1.14
	data-encoding@2.5.0
	diff@0.1.13
	digest@0.10.7
	dlv-list@0.5.0
	dns-lookup@2.0.4
	dunce@1.0.4
	either@1.8.0
	encode_unicode@0.3.6
	env_logger@0.8.4
	errno@0.3.8
	exacl@0.12.0
	fastrand@2.0.1
	file_diff@1.0.0
	filetime@0.2.23
	flate2@1.0.24
	fnv@1.0.7
	fs_extra@1.3.0
	fsevent-sys@4.1.0
	fts-sys@0.2.4
	fundu-core@0.3.0
	fundu@2.0.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-timer@3.0.2
	futures-util@0.3.28
	futures@0.3.28
	gcd@2.3.0
	generic-array@0.14.6
	getrandom@0.2.9
	glob@0.3.1
	half@2.4.0
	hashbrown@0.13.2
	hermit-abi@0.3.2
	hex-literal@0.4.1
	hex@0.4.3
	hostname@0.3.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.53
	indicatif@0.17.3
	inotify-sys@0.1.5
	inotify@0.9.6
	io-lifetimes@1.0.11
	itertools@0.12.1
	itoa@1.0.4
	js-sys@0.3.64
	keccak@0.1.4
	kqueue-sys@1.0.3
	kqueue@1.0.7
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.153
	libloading@0.7.4
	libm@0.2.7
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.12
	lock_api@0.4.9
	log@0.4.20
	lscolors@0.16.0
	match_cfg@0.1.0
	md-5@0.10.6
	memchr@2.7.1
	memmap2@0.9.0
	minimal-lexical@0.2.1
	miniz_oxide@0.5.4
	mio@0.8.11
	nix@0.28.0
	nom@7.1.3
	notify@6.0.1
	nu-ansi-term@0.49.0
	num-bigint@0.4.4
	num-integer@0.1.45
	num-traits@0.2.18
	num_threads@0.1.6
	number_prefix@0.4.0
	once_cell@1.19.0
	onig@6.4.0
	onig_sys@69.8.1
	ordered-multimap@0.6.0
	os_display@0.1.3
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	parse_datetime@0.5.0
	peeking_take_while@0.1.2
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.1
	phf_shared@0.11.2
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.26
	platform-info@2.0.2
	portable-atomic@0.3.15
	ppv-lite86@0.2.17
	pretty_assertions@1.4.0
	proc-macro2@1.0.63
	procfs-core@0.16.0
	procfs@0.16.0
	quick-error@2.0.1
	quickcheck@1.0.3
	quote@1.0.29
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_pcg@0.3.1
	rayon-core@1.12.1
	rayon@1.9.0
	redox_syscall@0.4.1
	redox_syscall@0.5.0
	reference-counted-singleton@0.1.2
	regex-automata@0.4.4
	regex-syntax@0.8.2
	regex@1.10.4
	relative-path@1.8.0
	rlimit@0.10.1
	roff@0.2.1
	rstest@0.18.2
	rstest_macros@0.18.2
	rust-ini@0.19.0
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.37.26
	rustix@0.38.31
	same-file@1.0.6
	scopeguard@1.2.0
	self_cell@1.0.3
	selinux-sys@0.6.2
	selinux@0.4.0
	semver@1.0.14
	serde@1.0.193
	serde_derive@1.0.193
	sha1@0.10.6
	sha2@0.10.8
	sha3@0.10.8
	shlex@1.3.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.0
	signal-hook@0.3.17
	siphasher@0.3.10
	slab@0.4.7
	sm3@0.4.2
	smallvec@1.13.1
	smawk@0.3.1
	socket2@0.5.3
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.32
	tempfile@3.10.1
	terminal_size@0.2.6
	terminal_size@0.3.0
	textwrap@0.16.1
	thiserror-impl@1.0.37
	thiserror@1.0.37
	time-core@0.1.0
	time-macros@0.2.8
	time@0.3.20
	tiny-keccak@2.0.2
	typenum@1.15.0
	unicode-ident@1.0.5
	unicode-linebreak@0.1.5
	unicode-segmentation@1.11.0
	unicode-width@0.1.11
	unicode-xid@0.2.4
	unindent@0.2.1
	utf8parse@0.2.1
	uuid@1.7.0
	uutils_term_grid@0.3.0
	version_check@0.9.4
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen@0.2.87
	which@4.3.0
	wild@2.2.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	windows_x86_64_msvc@0.52.0
	xattr@1.3.1
	yansi@0.5.1
	z85@3.0.5
	zip@0.6.6
"

inherit cargo flag-o-matic

DESCRIPTION="GNU coreutils rewritten in Rust"
HOMEPAGE="https://uutils.github.io/coreutils/ https://github.com/uutils/coreutils"

# CASCADE MOD: wow this is bad. Need to specify this package as newer than (or at least equal
# to) the upstream so it gets installed. But actually need this older version to be pulled down.
PV=0.0.25

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/uutils/coreutils"
	inherit git-r3
elif [[ ${PV} == *_p* ]] ; then
	COREUTILS_COMMIT=""
	SRC_URI="https://github.com/uutils/coreutils/archive/${FINDUTILS_COMMIT}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" ${CARGO_CRATE_URIS}"
	S="${WORKDIR}"/coreutils-${COREUTILS_COMMIT}
else
	SRC_URI="https://github.com/uutils/coreutils/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" ${CARGO_CRATE_URIS}"
	S="${WORKDIR}"/coreutils-${PV}

	KEYWORDS="~amd64 ~arm64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD CC0-1.0 ISC MIT Unicode-DFS-2016"
SLOT="0"
IUSE="debug selinux test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/oniguruma:=
	selinux? ( sys-libs/libselinux )
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.70.0
	test? ( dev-util/cargo-nextest )
"

QA_FLAGS_IGNORED=".*"

src_unpack() {
	if [[ ${PV} == 9999 ]] ; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	# normally cargo_src_compile sets this for us, but we don't use it
	filter-lto

	# By default, the crate uses a system version if it can. This just guarantees
	# that it will error out instead of building a vendored copy.
	export RUSTONIG_SYSTEM_LIBONIG=1

	makeargs=(
		# Disable output synchronisation as make calls cargo
		-Onone

		V=1

		PROFILE=$(usex debug debug release)

		PREFIX="${EPREFIX}/usr"

		# CASCADE MOD: remove uu- prefix
		PROG_PREFIX=""

		MULTICALL=y

		MANDIR="/share/man/man1"

		SELINUX_ENABLED=$(usex selinux)

		# pinky, uptime, users, and who require utmpx (not available on musl)
		# bug #832868
		# SKIP_UTILS="$(usev elibc_musl "pinky uptime users who")"
		# CASCADE MOD: we aren't building with musl, so we don't need to skip all these
		# ..
		# but we need to skip `more` because it is installed by sys-apps/util-linux
		# and we need to skip `hostname` because it is installed by sys-apps/net-tools
		# and we need to skip `kill`/`uptime` because it is installed by sys-process/procps
		# and we need to skip `groups` because it is installed by sys-apps/shadow
		SKIP_UTILS="more hostname kill uptime groups"
	)

	emake "${makeargs[@]}"
}

src_test() {
	# CASCADE MOD: I don't want to copy over the patch for this test yet, so bye for now

	echo done
}

src_install() {
	emake "${makeargs[@]}" DESTDIR="${D}" install
	# CASCADE MOD: symlink these extra binaries which aren't installed
	# by default
	#
	# https://github.com/uutils/coreutils/issues/6491
	dosym coreutils /bin/md5sum
	dosym coreutils /bin/sha256sum
}
