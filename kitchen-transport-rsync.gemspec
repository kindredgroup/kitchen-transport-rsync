# -*- encoding: utf-8 -*-
#
# Copyright 2015 North Development AB
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

$:.push File.expand_path('../lib', __FILE__)

require 'kitchen-transport-rsync/version'

Gem::Specification.new do |spec|
  spec.name = 'kitchen-transport-rsync'
  spec.version = Kitchen::Transport::Rsync::VERSION
  spec.authors = 'Ilja Bobkevic'
  spec.email = 'ilja.bobkevic@unibet.com'
  spec.description = 'Additional Test kitchen transport using rsync'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/unibet/kitchen-transport-rsync'
  spec.license = 'Apache 2'

  spec.files = `git ls-files`.split($/)
  spec.executables = []
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'test-kitchen', '~> 1.4'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
