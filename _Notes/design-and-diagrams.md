# Design & diagrams

When the design chapter is needed, how to approach it, and rules per diagram type.

## When is design required?

> The design chapter is **not always required**. When the work is a theoretical
> study or a system deployment, drawing class or sequence diagrams is unnecessary —
> often counter-productive.
>
> For development work, however, design is mandatory.

So:

| Project type | Design chapter? |
|---|---|
| Theoretical study | No. |
| Pure deployment / ops | No. |
| Development of a new application | Yes — required. |
| Extension of an existing app | Yes — but scoped to the new module. |
| Migration / refactor | Optional — diagram only the redesigned parts. |

## Recommendations

- **Pick a methodology** up front: a unified process (UP / 2TUP), an agile method.
  State it explicitly and apply it consistently.
- **Choose the relevant diagrams** for your application. The usual mandatory set
  is: **use-case**, **class**, **sequence**. Add any further diagram that earns
  its place (e.g. *deployment* for a multi-tier app).
- **Clear, readable, well explained** — but not buried in detail. Long explanations
  get tiresome.
- **Too big? Split.** Either represent the diagram in pieces, or abstract away
  some detail. If splitting really is impossible, print on A3 and fold the page —
  but every label must remain legible.

## Sequence diagrams

A sequence diagram:

- Represents **one possible scenario** inside a use case. You do not need to show
  every execution path.
- Represents **interactions between objects** — every instance in a sequence
  diagram should correspond to a class that appears in the class diagram.
- **Must not contain a lifeline called "System" or "Database"** unless you intend
  to detail that box in a later diagram. From the original guide:
  > A sequence diagram should not contain something called "System" or "Database",
  > unless you intend to detail those later in another diagram.
  These generic boxes hide design decisions instead of revealing them. Replace
  "System" with the actual controller/service objects involved; replace "Database"
  with the DAO / repository class names.
- Many sequence diagrams are usually possible. Pick **2 or 3** of the most
  important.

> And no, authentication is not one of them.

(Reviewer joke from the template — but it has a point: pick scenarios that show
*your* contribution, not boilerplate flows.)

## Class diagrams

A class diagram:

- **Reflects the chosen software architecture.** If you use MVC, the three layers
  must be visible via packages.
- **Stereotypes are strongly encouraged.** For a web app, use stereotypes
  (`«entity»`, `«controller»`, `«boundary»`, etc.) to make the role of each class
  obvious without having to read the body.
- **Don't confuse classes with database tables.** Resist the temptation to put
  an `id` field on every class. A class diagram is a conceptual model, not a
  schema. Database schemas belong in the implementation chapter (or appendix).

## Use-case diagrams

(Implicit in the template — common knowledge for INSAT PFE.)

- One use-case diagram per actor group is fine — don't try to cram all 30
  use cases into a single picture.
- Distinguish primary actors (initiate use cases) from secondary actors (assist).
- Use `«include»` and `«extend»` sparingly. They are often abused for things that
  are not actually inclusions or extensions.
