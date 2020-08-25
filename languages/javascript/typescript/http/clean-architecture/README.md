# Clean architecture

[Based from the NodeJS example](../../../node/http/clean-architecture/README.md) where we structure the application with clean architecture in mind.

One of the issues with the NodeJS is that because types parameters are passed as functions the intellisence is lost from dependencies, to fix this
we can use typescript which also adds more intellisense to make the experience better.

## 

Every thing starts here [index.ts](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/typescript/http/clean-architecture/src/index.ts), we 
we instantate everything and setup the service. Using dependency injection we add each of our dependencies into one another, but you'll notice I don't type the parameters
with these classes I type them with interfaces, this allows us to change the implementation later down in the line.

This is very much inspired again by [Clean](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) and [Hexagonal](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)) architecture. This allows us to produce better quality sooftware because we don't pollute our business logic with http/json concerns. Infact inside account [account](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/typescript/http/clean-architecture/src/account) directory is just plain javascript, which makes it really easy to test.