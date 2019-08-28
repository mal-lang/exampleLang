# exampleLang

exampleLang is a MAL language intended to demonstrate the Maven project structure of a MAL language.

This project has the following structure:

* The file `pom.xml` is the Maven configuration file of the project.
* The directory `src/main/mal` contains the MAL specification `exampleLang.mal`, which is the MAL specification of exampleLang.
* The directory `src/main/resources/icons` contains SVG icons for the assets in exampleLang.
* The directory `src/test/java/org/mal_lang/examplelang/test` contains the unit tests of exampleLang.

## Apache Maven

[Apache Maven](https://maven.apache.org/) is a build tool and dependency management tool for Java projects. You can read more about Maven at <https://en.wikipedia.org/wiki/Apache_Maven>. Follow the instructions at <https://maven.apache.org/download.cgi> to download Maven, and follow the instructions at <https://maven.apache.org/install.html> to install Maven.

## Building exampleLang and running the unit tests

The [MAL compiler](https://github.com/meta-attack-language/malcompiler) compiles MAL specifications (`.mal` files) into different formats, using different backends. The reference backend generates Java code that is suitable for testing purposes and evaluating your language. The securiCAD backend generates a `.jar` file that can be used with [foreseeti](https://www.foreseeti.com/)'s products, including [securiCAD](https://www.foreseeti.com/securicad/), which is a tool that can be used to graphically create models using your language and to simulate attacks on those models.

To build exampleLang, you need to have `mal-maven-plugin` installed in your local Maven repository. Follow the instructions at <https://github.com/meta-attack-language/malcompiler/blob/master/README.md> to install `mal-maven-plugin`.

To build a `.jar` file compatible with securiCAD, you need access to foreseeti's maven repository. If you have a username and a password, you need to enter them into `~/.m2/settings.xml`. Here is an example of how `settings.xml` can look:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0
                              http://maven.apache.org/xsd/settings-1.1.0.xsd"
          xmlns="http://maven.apache.org/SETTINGS/1.1.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <servers>
    <server>
      <id>maven.foreseeti.com.release</id>
      <username>USERNAME</username>
      <password>PASSWORD</password>
    </server>
    <server>
      <id>maven.foreseeti.com.snapshot</id>
      <username>USERNAME</username>
      <password>PASSWORD</password>
    </server>
  </servers>
</settings>
```

### Building a securiCAD compatible .jar file and running the unit tests

If you have entered your credentials to foreseeti's maven repository, you can build a securiCAD compatible `.jar` file and run the unit tests with the following command:

```
mvn package
```

The resulting `.jar` file will be located in `target/examplelang-1.0.0.jar`.

### Only building a securiCAD compatible .jar file

If you don't want to run the unit tests, you can build a securiCAD compatible `.jar` file with the following command:

```
mvn package -P build-only
```

The resulting `.jar` file will be located in `target/examplelang-1.0.0.jar`.

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
    * `src/test/java/org/mal_lang/examplelang/test/TestExampleLang.java`
* Update `README.md` with relevant information about your language. Information about how to use Markdown can be found at <https://help.github.com/en/articles/basic-writing-and-formatting-syntax>.
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
    * Example: `com.example.mylang.test`
* Rename `src/main/mal/exampleLang.mal` to the name of the main MAL specification of your language
  * `mv src/main/mal/exampleLang.mal src/main/mal/myLang.mal`
* Update your main MAL specification's `#id` and `#version`
  * Example: `#id: "com.example.mylang"`, `#version: "1.0.0"`
* Rename `src/test/java/org/mal_lang/examplelang/test/TestExampleLang.java` to reflect your language
  * `mkdir -p src/test/java/com/example/mylang/test`
  * `mv src/test/java/org/mal_lang/examplelang/test/TestExampleLang.java src/test/java/com/example/mylang/test/TestMyLang.java`
* Change the package name of the unit tests to the test package name of your language
  * Example: `package com.example.mylang.test;`
