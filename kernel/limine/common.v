module limine

@[_linker_section: '.requests_start_marker']
@[cinit]
__global (
	volatile limine_requests_start_marker = [
		u64(0xf6b8f4b39de7d1ae),
		0xfab91a6940fcb9cf,
		0x785c6ed015d3e316,
		0x181e920a7852b9d9,
	]!
)

@[_linker_section: '.requests_end_marker']
@[cinit]
__global (
	volatile limine_requests_end_marker = [
		u64(0xadc0e0531bb10d03),
		0x9572709f31764c62,
	]!
)

pub struct BaseRevision {
	id       [2]u64 = [u64(0xf9562b2d5c95a6c8), 0x6a7b384944536bdc]!
pub:
	revision u64
}

pub struct Uuid {
pub:
	a u32
	b u16
	c u16
	d [8]u8
}

pub enum MediaType as u32 {
	generic
	optical
	tftp
}

pub struct File {
pub:
	revision        u64
	address         voidptr
	size            u64
	path            charptr
	cmdline         charptr
	media_type      u32
	unused          u32
	tftp_ip         u32
	tftp_port       u32
	partition_index u32
	mbr_disk_id     u32
	gpt_disk_uuid   Uuid
	gpt_part_uuid   Uuid
	part_uuid       Uuid
}

pub enum FirmwareType as u64 {
	x86bios
	uefi32
	uefi64
	sbi
}

pub struct VideoMode {
pub:
	pitch            u64
	width            u64
	height           u64
	bpp              u16
	memory_model     u8
	red_mask_size    u8
	red_mask_shift   u8
	green_mask_size  u8
	green_mask_shift u8
	blue_mask_size   u8
	blue_mask_shift  u8
}

pub struct Framebuffer {
pub:
	address          voidptr
	width            u64
	height           u64
	pitch            u64
	bpp              u16
	memory_model     u8
	red_mask_size    u8
	red_mask_shift   u8
	green_mask_size  u8
	green_mask_shift u8
	blue_mask_size   u8
	blue_mask_shift  u8
	unused           u8
	edid_size        u64
	edid             voidptr
	// Response revision 1
	mode_count       u64
	modes            &&VideoMode
}

pub struct MpInfo {
pub:
	processor_id   u32
	lapic_id       u32
	reserved       u64
	goto_address   fn (&MpInfo) = unsafe { nil }
	extra_argument u64
}

pub enum MemmapEntryType as u64 {
	usable
	reserved
	acpi_reclaimable
	acpi_nvs
	bad_memory
	bootloader_reclaimable
	executable_and_modules
	framebuffer
}

pub struct MemmapEntry {
pub:
	base   u64
	length u64
	@type  u64
}

pub const internal_module_required = 1 << 0
pub const internal_module_compressed = 1 << 1

pub struct InternalModule {
pub:
	path    &i8
	cmdline &i8
	flags   u64
}
