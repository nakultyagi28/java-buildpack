# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'fileutils'
require 'java_buildpack/component/base_component'
require 'java_buildpack/container'
require 'java_buildpack/container/tomcat/tomcat_utils'

module JavaBuildpack
  module Container

    # Encapsulates the detect, compile, and release functionality for Tomcat Spring Insight support.
    # DO NOT DEPEND ON THIS
    class TomcatInsightSupport < JavaBuildpack::Component::BaseComponent
      include JavaBuildpack::Container

      # @macro detect_component_compile
      def detect
      end

      # @macro base_component_compile
      def compile
        link_to(container_libs_directory.children, tomcat_lib) if container_libs_directory.exist?
        link_to(extra_applications_directory.children, tomcat_webapps) if extra_applications_directory.exist?
      end

      # @macro base_component_release
      def release
      end

      private

      def container_libs_directory
        @droplet.root + '.spring-insight/container-libs'
      end

      def extra_applications_directory
        @droplet.root + '.spring-insight/extra-applications'
      end

    end

  end
end
