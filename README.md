# Praeceptor

#### level up your programming skills

### Architecture

- Actions
  - Each controller action (create, update, and destroy) requires a separate class for that action   
- Controllers
  - Controllers are responsible for assigning an instance variable and rendering or redirecting.  All other logic should live in actions, facades, or queries.  Only one instance variable should be set per controller action. If additional instance variables are required then that action will require a facade. Lastly, controllers are restricted to only the following actions: `index`, `new`, `create`, `edit`, `update`, `delete`, `destroy`
- Facades
  - Facades are simple ruby objects that are responsible for creating `attr_reader`s so that a controller can instantiate all of the data that a view will need in one object. All facades should strictly follow the Law of Demeter.
- Forms
  - Forms will contain all validations for the models to which they are a form for.  They will set all attributes needed for the form.  There should never be a form view that does not have a corresponding form object.
- Models
  - models should contain nothing.  All validations should live in form objects and on the database.  Anything needed for presentation should live in presenters which should be extended at the controller level.
- Presenters
  - Any special formatting or methods required strictly for the view should live within this directory. It should only contain logic for user facing views.
- Queries
  - Any query that requires two or more tables should have a corresponding query object. 
