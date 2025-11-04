@[has_globals]
module main

import limine

@[_linker_section: '.requests']
@[cinit]
__global (
	volatile base_revision = limine.BaseRevision{
		revision: 3
	}

	volatile framebuffer_request = limine.FramebufferRequest{
		response: unsafe { nil }
	}
)

pub fn main() {
	if base_revision.revision != 0 {
		for {}
	}

	if framebuffer_request.response == unsafe { nil } {
		for {}
	}

	framebuffer := unsafe { framebuffer_request.response.framebuffers[0] }

	width := framebuffer.width
	height := framebuffer.height

	stride := framebuffer.pitch / 4
	mut slice := &u32(framebuffer.address)

	for i := u64(0); i < width; i++ {
		for j := u64(0); j < height; j++ {
			unsafe {
				slice[j * stride + i] = u32((i * 255 / width) << 16 | (j * 255 / height) << 8)
			}
		}
	}

	for {}
}
