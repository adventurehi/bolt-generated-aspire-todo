var builder = DistributedApplication.CreateBuilder(args);

var api = builder.AddProject<Projects.AspireTodo_WebApi>("webapi");

builder.AddProject<Projects.AspireTodo_BlazorFrontend>("frontend")
    .WithReference(api);

builder.Build().Run();
