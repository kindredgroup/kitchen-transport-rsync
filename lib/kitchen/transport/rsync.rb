#
# Author:: Ilja Bobkevic <ilja.bobkevi@unibet.com>
#
# Copyright 2015, North Development AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'kitchen/transport/ssh'

module Kitchen
  module Transport
    class Rsync < Ssh

      def create_new_connection(options, &block)
        if @connection
          logger.debug("[SSH] shutting previous connection #{@connection}")
          @connection.close
        end

        @connection_options = options
        @connection = self.class::Connection.new(options, &block)
      end

      class Connection < Ssh::Connection
        def upload(locals, remote)
          Array(locals).each do |local|
            full_remote = File.join(remote, File.basename(local))
            recursive = File.directory?(local)
            execute("mkdir -p #{full_remote}") if recursive
            time = Benchmark.realtime do
              ssh_command = [login_command.command, login_command.arguments[0..-2]].flatten.join(' ')
              sync_command = "rsync -e '#{ssh_command}' -a#{@logger.debug? ? 'v' : ''}z #{local} #{@session.options[:user]}@#{@session.host}:#{remote}"
              @logger.debug("[RSYNC] Running rsync command: #{sync_command}")
              system(sync_command)
            end
            logger.debug("[RSYNC] Time taken to upload #{local} to #{self}:#{full_remote}: %.2f sec" % time)
          end
        end
      end

    end
  end
end
