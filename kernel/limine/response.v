module limine

pub struct BootloaderInfoResponse {
pub:
	revision u64
	name     charptr
	version  charptr
}

pub struct FirmwareTypeResponse {
pub:
	revision      u64
	firmware_type FirmwareType
}

pub struct StackSizeResponse {
pub:
	revision u64
}

pub struct HhdmResponse {
pub:
	revision u64
	offset   u64
}

pub struct FramebufferResponse {
pub:
	revision          u64
	framebuffer_count u64
	framebuffers      &&Framebuffer
}

pub struct PagingModeResponse {
pub:
	revision u64
	mode     u64
}

pub struct MpResponse {
pub:
	revision     u64
	flags        u32
	bsp_lapic_id u32
	cpu_count    u64
	cpus         &&MpInfo
}

pub struct MemmapResponse {
pub:
	revision    u64
	entry_count u64
	entries     &&MemmapEntry
}

pub struct EntryPointResponse {
pub:
	revision u64
}

pub struct KernelFileResponse {
pub:
	revision    u64
	kernel_file &File
}

pub struct ModuleResponse {
pub:
	revision     u64
	module_count u64
	modules      &&File
}

pub struct RsdpResponse {
pub:
	revision u64
	address  voidptr
}

pub struct SmbiosResponse {
pub:
	revision u64
	entry_32 voidptr
	entry_64 voidptr
}

pub struct EfiSystemTableResponse {
pub:
	revision u64
	address  voidptr
}

pub struct EfiMemmapResponse {
pub:
	revision     u64
	memmap       voidptr
	memmap_size  u64
	desc_size    u64
	desc_version u64
}

pub struct BootTimeResponse {
pub:
	revision  u64
	boot_time i64
}

pub struct KernelAddressResponse {
pub:
	revision      u64
	physical_base u64
	virtual_base  u64
}

pub struct DtbResponse {
pub:
	revision u64
	dtb_ptr  voidptr
}

pub struct RiscvBspHartidResponse {
pub:
	revision   u64
	bsp_hartid u64
}
