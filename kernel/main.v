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

	for i := u64(0); i < 100; i++ {
		unsafe {
			mut slice := &u32(framebuffer.address)
			slice[i * (framebuffer.pitch / 4) + i] = 0xffffff
		}
	}

	for {}
}
