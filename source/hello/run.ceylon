import io.vertx.core { ... }
import io.vertx.ext.web { ... }

shared class Server() extends AbstractVerticle() {
    
    shared actual void start() {
        value router = Router.router(vertx);
        
        router.route().handler((routingContext) => 
            routingContext.response().putHeader("content-type", "text/html").end("Hello, world"));
        
        vertx.createHttpServer().requestHandler(router.accept).listen(8080);
    }
}

shared void run() {
    value vertx = Vertx.vertx();
    
    vertx.deployVerticle("hello.Server");
}
