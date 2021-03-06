<!--

    Copyright 2017 Goldman Sachs.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

-->

# Gradle API

Modify your build.gradle as follows to call this out, in case you use
gradle directly w/out maven:

1. Add java plugin:
    ```
    apply plugin: 'java'
    ```

2. Add dependency on obevo-dist:

    ```
    dependencies { ... testCompile 'com.goldmansachs.obevo:obevo-cli:${obevo.version}' }
    ```

3. Create a new task:

    ```
    task(testDatabaseDeploy, dependsOn:'classes', type:JavaExec, description:'Test database deployment') {
        main = "com.gs.obevo.dist.Main"
        classpath = sourceSets.test.runtimeClasspath
        args 'DEPLOY', '-sourcePath', 'src/main/database', '-env', 'test', '-noPrompt'

        // Use the '-cleanFirst' argument to wipe the db first!
    }
    ```
