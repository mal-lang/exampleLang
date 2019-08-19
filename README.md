# exampleLang

exampleLang is a MAL language intended to demonstrate the maven project structure of a MAL language.

The project has the following structure:

* The file `pom.xml` is the maven configuration file of the project.
* The directory `src/main/mal` contains the MAL specification `exampleLang.mal`, which is the MAL specification of exampleLang.
* The directory `src/main/resources/icons` contains SVG icons for the assets in exampleLang.
* The directory `src/test/java/com/foreseeti/test/examplelang` contains the unit tests of exampleLang.

## Building

To build exampleLang, you need to have `mal-maven-plugin` installed in your local maven repository.

To build a `.jar` file compatible with securiCAD, two dependencies have to be installed, `corelib` and `simulator`. If you have the `.jar` files `corelib-1.5.1.jar` and `simulator-1.5.1.jar`, they can be installed into your local maven repository with the following commands:

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
