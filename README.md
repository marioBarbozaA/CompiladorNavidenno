# CompiladorNavideño: Curso de Verano 2023 de Compiladores e Intérpretes

Bienvenidos al repositorio de CompiladorNavideño, un proyecto desarrollado como parte del Curso de Verano 2023 de Compiladores e Intérpretes.

## 👨‍💻 Integrantes del Equipo

- Camilo Sanchez
- Mario Barboza

## 🎓 Profesor

- Allan Rodriguez Dávila

## 🌟 Acerca del Proyecto

CompiladorNavideño es un proyecto enfocado en el desarrollo de un compilador e intérprete con un enfoque navideño. El objetivo es aprender y aplicar los conceptos fundamentales de la compilación y la interpretación de lenguajes de programación se utiliza Cup y Jflex.

## 🚀Para Ejecutar el Proyecto

```bash
mvn clean cup:generate jflex:generate compile exec:java
```

## 📂 Estructura del Repositorio

El proyecto CompiladorNavideño está organizado de la siguiente manera:

```bash
────CompiladorNavidenno
├───src
│ ├───main
│ │ ├───cup
│ │ └───parser.cup
│ │ ├───java
│ │ │ └───com
│ │ │ └───navidad
│ │ │ ├───App.java
│ │ │ ├───Lexer.java
│ │ │ ├───parser.java
│ │ │ ├───sym.java
│ │ │ └───Table.java
│ │ └───jflex
│ │ └───lexer.jflex
│ └───test
│ └───java
│ └───com
│ └───navidad
│ ├───AppTest.java
│ ├───Carta_a_Santa.html
│ └───Carta_a_Santa.txt
├───target
│
└───pom.xml
```

## 💡 Notas Importantes

> [!NOTE]
> Este proyecto es parte de una experiencia educativa y está destinado principalmente para fines de aprendizaje y exploración en el ámbito de la compilación.

> [!WARNING]
> Asegúrate de seguir las instrucciones de instalación y ejecución para evitar problemas.

> [!IMPORTANT]
> La colaboración y el feedback son siempre bienvenidos. Sin embargo, tenga en cuenta que este proyecto es parte de una experiencia educativa y no está destinado a ser utilizado en un entorno de producción.

## 📚 Documentación

- [Manual de Usuario](https://estudianteccr-my.sharepoint.com/:w:/g/personal/2021075241_estudiantec_cr/EfrZ9TDNVWZEoYgB_CFyBZUBpNYCSIv7tlmb4lqqqxJy5w?e=SgWaTk)
- [Manual Técnico](https://estudianteccr-my.sharepoint.com/:w:/g/personal/2021075241_estudiantec_cr/ESx-10rDiJpIvjpgLJcLQN4BNZPN5n5n7VVG9ZPT7pScbg?e=UmSGwh)

## 📌 Referencias y Recursos Adicionales

En el desarrollo de CompiladorNavideño, nos hemos apoyado en una variedad de recursos y documentaciones para integrar correctamente las herramientas y tecnologías empleadas. Aquí hay algunos enlaces útiles que también podrían ser de interés para quienes deseen profundizar más en el proyecto:

- [JFlex User Manual](https://jflex.de/manual.html#Example): Un recurso esencial para entender cómo implementar y utilizar JFlex en proyectos de análisis léxico.
- [CUP Maven Plugin en GitHub](https://github.com/vbmacher/cup-maven-plugin): El plugin de CUP para Maven, una herramienta clave para la integración de CUP en nuestro proyecto.
- [JFlex Maven Plugin](https://jflex-de.github.io/jflex-web/jflex-maven-plugin/plugin-info.html): Información detallada sobre el plugin de Maven para JFlex, útil para la automatización y gestión de dependencias.
- [CUP Examples](https://www2.cs.tum.edu/projects/cup/examples.php): Ejemplos de cómo utilizar CUP en diferentes contextos, lo cual fue fundamental para nuestro aprendizaje y desarrollo.

Estos recursos nos han ayudado significativamente a lo largo del proyecto y esperamos que también sean valiosos para aquellos interesados en explorar más sobre compiladores e intérpretes.

---

¡Esperamos que este proyecto sea de gran aprendizaje!
