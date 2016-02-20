# encoding: UTF-8

require_relative '../lib/winrm/wsmv/command'

describe 'Command', unit: true do
  context 'default session options' do
    session_opts = {
      endpoint: 'http://localhost:5985/wsman',
      max_envelope_size: 153600,
      session_id: '05A2622B-B842-4EB8-8A78-0225C8A993DF',
      operation_timeout: 60,
      locale: 'en-US'
    }
    shell_id = 'D5A2622B-B842-4EB8-8A78-0225C8A993DF'
    command_id = 'A2A2622B-B842-4EB8-8A78-0225C8A993DF'
    it 'creates a well formed message' do
      xml = WinRM::WSMV::Command.new(session_opts, shell_id, WinRM::WSMV::Header::RESOURCE_URI_CMD,
                                     command_id, 'ipconfig').build
      expect(xml).to include('<w:OperationTimeout>PT60S</w:OperationTimeout>')
    end
  end
end