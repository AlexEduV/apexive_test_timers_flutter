Every timer should have these properties:

1. Title
2. Description
3. Project
4. AssignedTo
5. DeadlineDate
6. StartTime
7. CurrentTime
8. isFavorite
9. isActive
10. isCompleted
11. Timer

This project requires no database usage. Instead, data is initialized
at 0 tasks and added/removed during the lifetime of the app. For this reason, the separate model file
has been created, that stores current tasks as an array of Task objects.
