Every timer should have these properties:

1.Title
2.Project Name
3.Deadline Date
4.Timer Time
5.isFavorite
6.isActive

the persistence model for this project entails no database usage. Instead, data is to be initialized
at 0 timers and added/removed during the lifetime of the app. For this reason, the separate model file
will be created, that will store current timers as an array of Timer objects. The separate class is
to be created.