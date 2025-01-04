module limine

const common_magic_1 = u64(0xc7b1dd30df4c8b88)
const common_magic_2 = u64(0x0a82e883a194f07b)

pub struct BootloaderInfoRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0xf55038d8e2a1202f,
	0x279426fcf5f59740,
]!
pub:
	revision u64
	response &BootloaderInfoResponse
}

pub struct FirmwareTypeRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x8c2f75d90bef28a8,
	0x7045a4688eac00c3,
]!
	revision u64
	response &FirmwareTypeResponse
}

pub struct StackSizeRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x224ef0460a8e8926,
	0xe1cb0fc25f46ea3d,
]!
pub:
	revision   u64
	response   &StackSizeResponse
	stack_size u64
}

pub struct HhdmRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x48dcf1cb8ad2b852,
	0x63984e959a98244b,
]!
pub:
	revision u64
	response &HhdmResponse
}

pub struct FramebufferRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x9d5827dcd881dd75,
	0xa3148604f6fab11b,
]!
pub:
	revision u64
	response &FramebufferResponse
}

pub struct PagingModeRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x95c1a0edab0944cb,
	0xa4e5cb3842f7488a,
]!
pub:
	revision u64
	response &PagingModeResponse
	mode     u64
	max_mode u64
	min_mode u64
}

pub struct MpRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x95a67b819a1b857e,
	0xa0b61b723b6a73e0,
]!
pub:
	revision u64
	response &MpResponse
	flags    u64
}

pub struct MemmapRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x67cf3d9d378a806f,
	0xe304acdfc50c3c62,
]!
pub:
	revision u64
	response &MemmapResponse
}

pub struct EntryPointRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x13d86c035a1cd3e1,
	0x2b0caa89d8f3026a,
]!
pub:
	revision u64
	response &EntryPointResponse
	entry    fn () = unsafe { nil }
}

pub struct KernelFileRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0xad97e90e83f1ed67,
	0x31eb5d1c5ff23b69,
]!
pub:
	revision u64
	response &KernelFileResponse
}

pub struct ModuleRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x3e7e279702be32af,
	0xca1c4f3bd1280cee,
]!
pub:
	revision u64
	response &ModuleResponse
	// Request revision 1
	internal_module_count u64
	internal_modules      &&InternalModule
}

pub struct RsdpRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0xc5e77b6b397e7b43,
	0x27637845accdcf3c,
]!
pub:
	revision u64
	response &RsdpResponse
}

pub struct SmbiosRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x9e9046f11e095391,
	0xaa4a520fefbde5ee,
]!
pub:
	revision u64
	response &SmbiosResponse
}

pub struct EfiSystemTableRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x5ceba5163eaaf6d6,
	0x0a6981610cf65fcc,
]!
pub:
	revision u64
	response &EfiSystemTableResponse
}

pub struct EfiMemmapRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x7df62a431d6872d5,
	0xa4fcdfb3e57306c8,
]!
pub:
	revision u64
	response &EfiMemmapResponse
}

pub struct BootTimeRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x502746e184c088aa,
	0xfbc5ec83e6327893,
]!
pub:
	revision u64
	response &BootTimeResponse
}

pub struct KernelAddressRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x71ba76863cc55f63,
	0xb2644a48c516a487,
]!
pub:
	revision u64
	response &KernelAddressResponse
}

pub struct DtbRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0xb40ddb48fb54bac7,
	0x545081493f81ffb7,
]!
pub:
	revision u64
	response &DtbResponse
}

struct RiscvBspHartidRequest {
	id [4]u64 = [
	common_magic_1,
	common_magic_2,
	0x1369359f025525f9,
	0x2ff2a56178391bb6,
]!
pub:
	revision u64
	response &RiscvBspHartidResponse
}
