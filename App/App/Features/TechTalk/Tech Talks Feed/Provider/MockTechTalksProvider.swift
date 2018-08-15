//
//  MockTechTalksProvider.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/11/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import Moya
import ModelProtocols

// swiftlint:disable line_length
final class MockTechTalksProvider {

    private init() { }

    static func mock() -> [TechTalk] {
        return [
            TechTalk(id: 1,
                     title: "Evolucionando con Swift",
                     description: "En la primera charla, @marcosgriselli nos va a contar acerca de algunas features nuevas de Swift 4.1 y 4.2. Analizaremos cómo estos cambios nos llevarán a escribir código más seguro y expresivo, y cómo podemos aplicarlo en el día a día de nuestras apps. También, repasaremos alguna proposal de Swift Evolution ya aceptada y veremos cómo esto impactará a futuro en nuestro código.",
                     speakers: [mockSpeakers()[0]]),
            TechTalk(id: 2,
                     title: "Mejorando nuestro Network Stack",
                     description: "@lucianopolit nos invita a descubrir cómo podemos definir la arquitectura de nuestros componentes de Networking, un módulo esencial en la gran mayoría de las apps. Aprenderemos cómo lograr una estructura mucho más sólida, limpia y reusable que nos sirva de base para nuestros proyectos, a través del uso del patrón de diseño interceptor. Se atacarán conceptos como cache de datos, logging, serialización, manejo de errores, entre otros.",
                     speakers: [mockSpeakers()[1]]),
            TechTalk(id: 3,
                     title: "Server Side Swift con Vapor",
                     description: "Finalmente, en modalidad de charla conjunta, @inahuelzapata y @FedeTrimboli nos van a dar una introducción a Server Side Swift utilizando el framework Vapor. Veremos como podemos salir con algo pequeño a producción en cuestión de minutos, con la idea de animarnos a que perdamos el miedo y todos empecemos a probar un poco de Server-Side Swift, aprovechando que no necesitamos cambiar de lenguaje para expandir nuestro stack.",
                     speakers: [mockSpeakers()[2], mockSpeakers()[3]])
        ]
    }

    static func mockSpeakers() -> [Speaker] {
        return [
            Speaker(id: 1,
                    firstName: "Marcos",
                    lastName: "Griselli",
                    photoURL: URL(string: "https://avatars0.githubusercontent.com/u/14804033?s=460&v=4")!,
                    githubURL: URL(string: "https://github.com/marcosgriselli")!),
            Speaker(id: 2,
                    firstName: "Luciano",
                    lastName: "Polit",
                    photoURL: URL(string: "https://avatars3.githubusercontent.com/u/11864162?s=460&v=4")!,
                    githubURL: URL(string: "https://github.com/LucianoPolit")!),
            Speaker(id: 3,
                    firstName: "Federico",
                    lastName: "Trimboli",
                    photoURL: URL(string: "https://avatars0.githubusercontent.com/u/3900360?s=460&v=4")!,
                    githubURL: URL(string: "https://github.com/fedetrim")!),
            Speaker(id: 3,
                    firstName: "Nahuel",
                    lastName: "Zapata",
                    photoURL: URL(string: "https://avatars1.githubusercontent.com/u/13871479?s=460&v=4")!,
                    githubURL: URL(string: "https://github.com/inahuelzapata")!)
        ]
    }
}
