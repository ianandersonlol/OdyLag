--[[Copyright © 2021, Arico
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of <addon name> nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. --]]

_addon.name = 'Odylag'
_addon.author = 'Arico'
_addon.version = '1'
_addon.command = 'ol'

require('pack')
require('strings')
require('logger')
packets = require('packets')


spell_list = 0 

windower.register_event('incoming chunk', function(id, original, modified, injected, blocked)
    if windower.ffxi.get_info().zone == 279 or windower.ffxi.get_info().zone == 294 then 
		if id == 0x065 then
			spell_list = 0
		end
		if id == 0x0AA then 
			spell_list = spell_list + 1
				if spell_list and spell_list > 2 then
					return true
				end
		end
	end
	
end)

windower.register_event('zone change', function()
  spell_list = 0 
end)

windower.register_event('job change', function()
  spell_list = 0 
end)

