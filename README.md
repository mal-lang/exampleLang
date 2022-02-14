# exampleLang

exampleLang is a MAL language intended to demonstrate the Maven
project structure of a MAL language.

This project has the following structure:

* The file `pom.xml` is the Maven configuration file of the project.
* The directory `src/main/mal` contains the MAL specification
  `exampleLang.mal`, which is the MAL specification of exampleLang.
* The directory `src/main/resources/icons` contains SVG icons for the
  assets in exampleLang.
* The directory `src/test/java/org/mal_lang/examplelang/test`
  contains the unit tests of exampleLang.

## Apache Maven

[Apache Maven](https://maven.apache.org/) is a build tool and
dependency management tool for Java projects. You can read more about
Maven at <https://en.wikipedia.org/wiki/Apache_Maven>. Follow the
instructions at <https://maven.apache.org/download.cgi> to download
Maven, and follow the instructions at
<https://maven.apache.org/install.html> to install Maven.

## Building exampleLang and running the unit tests

The
[MAL compiler](https://github.com/meta-attack-language/malcompiler)
compiles MAL specifications (`.mal` files) into different formats,
using different backends. The reference backend generates Java code
that is suitable for testing purposes and evaluating your language.
The securiCAD backend generates a `.jar` file that can be used with
[foreseeti](https://foreseeti.com)'s products, including
[securiCAD](https://foreseeti.com/securicad), which is a tool
that can be used to graphically create models using your language and
to simulate attacks on those models.

### Building with the reference backend and running the unit tests

To compile exampleLang with the reference backend of the MAL compiler
and then run the unit tests, execute the following command from the
`exampleLang` directory:

```
mvn test
```

This will invoke the MAL compiler's reference backend to generate
`.java` files under `target/generated-test-sources`. These `.java`
files and the unit tests in `src/test/java` will then be compiled
into `.class` files under `target/test-classes`. The unit tests will
then finally be executed.

To only compile exampleLang into `.java` files, execute the following
command:

```
mvn generate-test-sources
```

To compile exampleLang into `.java` files and then compile these
`.java` files and the unit tests in `src/test/java` into `.class`
files, execute the following command:

```
mvn test-compile
```

To run a specific test class, execute the following command:

```
mvn test -Dtest=TestExampleLang
```

Where `TestExampleLang` is the test class.

To run a specific test method in a test class, execute the following
command:

```
mvn test -Dtest=TestExampleLang#testNoPassword
```

Where `TestExampleLang` is the test class and `testNoPassword` is the
test method.

### Building a securiCAD compatible .jar file

In order to use your language with foreseeti’s products, it is necessary to build a securiCAD-compatible `.jar` file and to obtain a copy of the securiCAD software. 

foreseeti offers a free version of the securiCAD Professional tool for MAL developers. Sign up [here](https://foreseeti.com/foreseeti-getting-started/) to get access to the securiCAD Professional tool as well as instruction on how to access the foreseeti Maven repository. 

To compile exampleLang with the securiCAD backend of the MAL
compiler, execute the following command:

```
mvn package -PsecuriCAD
```

The resulting `.jar` file will be located in
`target/examplelang-1.0.0.jar`.

If you don't want to run the unit tests when building a securiCAD
compatible `.jar` file, execute the following command:

```
mvn clean package -PsecuriCAD -Dmaven.test.skip=true
```

## Using exampleLang as a template MAL language

To create a new language using exampleLang as a template, you need to
do the following:

* Create a new MAL language project using exampleLang as the template
  * `cp -r exampleLang/ myLang/`
* Enter the directory of the new MAL language project
  * `cd myLang/`
* Update `LICENSE` with a license of your choice
  * Update copyright notices to reflect your license in
    * `NOTICE`
    * `README.md`
    * `pom.xml`
    * `src/main/mal/exampleLang.mal`
    * `src/test/java/org/mal_lang/examplelang/test/*.java`
* Update `README.md` with relevant information about your language.
  Information about how to use Markdown can be found at
  <https://help.github.com/en/articles/basic-writing-and-formatting-syntax>.
* Update `pom.xml` to reflect your project
  * Update `<groupId>` with a reverse domain name that you can use
    * Example: `com.example`
  * Update `<artifactId>` with a suitable name
    * Example: `mylang`
  * Update `<version>` with the version of your language
    * Example: `1.0.0`
  * Update `<name>` with the name of your language
    * Example: `myLang`
  * Update `<mal.file>` with the name of the main MAL specification
    of your language
    * Example: `myLang.mal`
  * Update `<mal.securicad.package>` with the package name of your
    language
    * Example: `com.example.mylang`
  * Update `<mal.reference.package>` with the test package name of
    your language
    * Example: `com.example.mylang.test`
* Rename `src/main/mal/exampleLang.mal` to the name of the main MAL
  specification of your language
  * `mv src/main/mal/exampleLang.mal src/main/mal/myLang.mal`
* Update your main MAL specification's `#id` and `#version`
  * Example: `#id: "com.example.mylang"`, `#version: "1.0.0"`
* Rename unit tests in `src/test/java` to reflect your language
* Change the package name of the unit tests to the test package name
  of your language
  * Example: `package com.example.mylang.test;`

## License

Copyright © 2020-2022 [Foreseeti AB](https://foreseeti.com)

All files distributed in the exampleLang project are licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0), except for the following files:

| File | License |
| --- | --- |
| [`Host.svg`](src/main/resources/icons/Host.svg) | <img src="src/main/resources/icons/Host.svg" alt="Host.svg" width="32" height="32"/> "[Computer](https://thenounproject.com/term/computer/576625/)" icon by [✦ Shmidt Sergey ✦](https://thenounproject.com/monstercritic/) from [the Noun Project](https://thenounproject.com/) is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). |
| [`Network.svg`](src/main/resources/icons/Network.svg) | <img src="src/main/resources/icons/Network.svg" alt="Network.svg" width="32" height="32"/> "[Network](https://thenounproject.com/term/network/691907/)" icon by [✦ Shmidt Sergey ✦](https://thenounproject.com/monstercritic/) from [the Noun Project](https://thenounproject.com/) is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). |
| [`Password.svg`](src/main/resources/icons/Password.svg) | <img src="src/main/resources/icons/Password.svg" alt="Password.svg" width="32" height="32"/> "[Lock](https://thenounproject.com/term/lock/576530/)" icon by [✦ Shmidt Sergey ✦](https://thenounproject.com/monstercritic/) from [the Noun Project](https://thenounproject.com/) is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). |
| [`User.svg`](src/main/resources/icons/User.svg) | <img src="src/main/resources/icons/User.svg" alt="User.svg" width="32" height="32"/> "[User](https://thenounproject.com/term/user/581261/)" icon by [✦ Shmidt Sergey ✦](https://thenounproject.com/monstercritic/) from [the Noun Project](https://thenounproject.com/) is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). |

See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE) for details.
