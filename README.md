# exampleLang

exampleLang is a MAL language intended to demonstrate the Maven project structure of a MAL language.

This project has the following structure:

* The file `pom.xml` is the Maven configuration file of the project.
* The directory `src/main/mal` contains the MAL specification `exampleLang.mal`, which is the MAL specification of exampleLang.
* The directory `src/main/resources/icons` contains SVG icons for the assets in exampleLang.
* The directory `src/test/java/com/foreseeti/test/examplelang` contains the unit tests of exampleLang.

## Apache Maven

[Apache Maven](https://maven.apache.org/) is a build tool and dependency management tool for Java projects. You can read more about Maven at <https://en.wikipedia.org/wiki/Apache_Maven>. Follow the instructions at <https://maven.apache.org/download.cgi> to download Maven, and follow the instructions at <https://maven.apache.org/install.html> to install Maven.

## Building exampleLang and running the unit tests

To build exampleLang, you need to have `mal-maven-plugin` installed in your local Maven repository. See the instructions in `README.md` in the `malcompiler` repository for instructions on how to install `mal-maven-plugin`.

To build a `.jar` file compatible with securiCAD, two dependencies have to be installed, `corelib` and `simulator`. If you have the `.jar` files `corelib-1.5.1.jar` and `simulator-1.5.1.jar`, they can be installed into your local Maven repository with the following commands:

```
mvn install:install-file -Dfile=corelib-1.5.1.jar -DgroupId=com.foreseeti -DartifactId=corelib -Dversion=1.5.1 -Dpackaging=jar 
mvn install:install-file -Dfile=simulator-1.5.1.jar -DgroupId=com.foreseeti -DartifactId=simulator -Dversion=1.5.1 -Dpackaging=jar
```

### Building a securiCAD compatible .jar file and running the unit tests

If you have the above dependencies installed, you can build a securiCAD compatible `.jar` file and run the unit tests with the following command:

```
mvn package
```

The resulting `.jar` file will be located in `target/exampleLang-1.0.0.jar`.

### Only building a securiCAD compatible .jar file

If you don't want to run the unit tests, you can build a securiCAD compatible `.jar` file with the following command:

```
mvn package -P build-only
```

The resulting `.jar` file will be located in `target/exampleLang-1.0.0.jar`.

### Only running the unit tests

If you don't want to build a securiCAD compatible `.jar` file, you can run the unit tests with the following command:

```
mvn test -P test-only
```

There will be no resulting `.jar` file from this command.

## Using exampleLang as a template MAL language

To create a new language using exampleLang as a template, you need to do the following:

* Create a new MAL language project using exampleLang as the template
  * `cp -r exampleLang/ myLang/`
* Enter the directory of the new MAL language project
  * `cd myLang/`
* Update `LICENSE` with a license of your choice
  * Update copyright notices to reflect your license in
    * `NOTICE`
    * `ACKNOWLEDGEMENTS`
    * `pom.xml`
    * `src/main/mal/exampleLang.mal`
    * `src/test/java/com/foreseeti/test/examplelang/TestExampleLang.java`
* Update `README.md` with relevant information about your language. Information about how to use Markdown can be found at <https://guides.github.com/features/mastering-markdown/>.
* Update `pom.xml` to reflect your project
  * Update `<groupId>` with a reverse domain name that you can use
    * Example: `com.example`
  * Update `<artifactId>` with a suitable name
    * Example: `mylang`
  * Update `<version>` with the version of your language
    * Example: `1.0.0`
  * Update `<name>` with the name of your language
    * Example: `myLang`
  * Update `<mal.file>` with the name of the main MAL specification of your language
    * Example: `myLang.mal`
  * Update `<mal.securicad.package>` with the package name of your language
    * Example: `com.example.mylang`
  * Update `<mal.reference.package>` with the test package name of your language
    * Example: `com.example.test.mylang`
* Rename `src/main/mal/exampleLang.mal` to the name of the main MAL specification of your language
  * `mv src/main/mal/exampleLang.mal src/main/mal/myLang.mal`
* Update your main MAL specification's `#id` and `#version`
  * Example: `#id: "com.example.mylang"`, `#version: "1.0.0"`
* Rename `src/test/java/com/foreseeti/test/examplelang/TestExampleLang.java` to reflect your language
  * `mkdir -p src/test/java/com/example/test/mylang`
  * `mv src/test/java/com/foreseeti/test/examplelang/TestExampleLang.java src/test/java/com/example/test/mylang/TestMyLang.java`
* Change the package name of the unit tests to the test package name of your language
  * Example: `package com.example.test.mylang;`
