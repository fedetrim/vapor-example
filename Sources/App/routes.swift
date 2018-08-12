import Vapor
import Models

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let techTalkController = TechTalkController()
    router.get("techTalks", use: techTalkController.index)
    router.post("techTalks", use: techTalkController.create)
    
    let reviewController = ReviewController()
    router.post("review", use: reviewController.create)
}
