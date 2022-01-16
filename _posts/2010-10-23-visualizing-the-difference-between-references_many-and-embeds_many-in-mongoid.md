---
title: Visualizing the difference between references_many and embeds_many in mongoid.
author: Joel
layout: post
permalink: /2010/10/23/visualizing-the-difference-between-references_many-and-embeds_many-in-mongoid/index.html
alias: /2010/10/23/visualizing-the-difference-between-references_many-and-embeds_many-in-mongoid/visualizing-the-difference-between-references_many-and-embeds_many-in-mongoid
categories:
  - Web Development
---
# 

*This one gave me fits for a little bit not too long ago, [and crept up on the mongoid list the other day][1].*

 [1]: https://groups.google.com/group/mongoid/browse_thread/thread/6e21edf44293f12

One of the greatest things about mongo in what it does is the idea of embedding documents into other documents – at times removing the need for relations where it makes sense. The classic example being Blog posts and comments within that post. Why not just shove the comments directly inside of the blog posts’ documents? It’s faster and makes sense – these are just documents right? So let’s treat them as such.

But on occasion the need for relations remains. On a toy app I’ve begun rewriting to use Rails3 and Mongo (Mongoid, specifically) I ran into a conceptual road-block that I’ve seen creep up on occasion between the other (relative) newbies like myself – how the relations are stored between Mongoid objects. I needed a relational association instead of just embedding (why? the size limit for collections probably would have bitten me in the ass in the future). But after following the conventions in the documentation and inspecting how things ended up in the database I realized I had a few things twisted. 

I think part of it, at least for me, is the **idea** of embedding gets in the way of how you perceive this getting stored within the mongo document(s). Take [the example at the mongoid documentation][2] under “Relational Associations” 

 [2]: https://mongoid.org/docs/associations/

```
class Person
  include Mongoid::Document
  references_many :prescriptions
end
class Prescription
  include Mongoid::Document
  referenced_in :person
end
```

When I look at that – I think that the *Person* would collect the references to *Prescription*, perhaps in a :prescriptions array. Such is not the case. Instead the Prescription objects contain a single reference to its “parent” object – Person. Below is a comparison of what you might think, versus how it’s actually stored in the database

```
john = Person.create
prescription = Prescription.create
john.prescriptions 
# {
# 	"_id" : ObjectId("4cc2f0bac0b37e9c17000001"),
# 	"_type" : "Person",
#	"prescriptions" : [ ObjectId("4cc2f0bac0b37e9c17000002") ]
# 	"created_at" : "Sat Oct 23 2010 10:27:06 GMT-0400 (EDT)"
# }
# prescription =>
# {
# 	"_id" : ObjectId("4cc2f0bac0b37e9c17000002"),
# 	"_type" : "Prescription",
# 	"created_at" : "Sat Oct 23 2010 10:27:06 GMT-0400 (EDT)"
# }
```

Versus what this is actually doing  
```
# john =>
# {
# 	"_id" : ObjectId("4cc2f0bac0b37e9c17000001"),
# 	"_type" : "Person",
# 	"created_at" : "Sat Oct 23 2010 10:27:06 GMT-0400 (EDT)"
# }
#
# prescription =>
# {
# 	"_id" : ObjectId("4cc2f0bac0b37e9c17000002"),
# 	"_type" : "Prescription",
# 	"created_at" : "Sat Oct 23 2010 10:27:06 GMT-0400 (EDT)",
# 	"person_id" : ObjectId("4cc2f0bac0b37e9c17000001")
# }
```

I realize this follows the same old ActiveRecord conventions of the parent ID being stored in the children objects, but when you develop that big ole’ crush on, and get married to, the idea of mongo’s embedded documents – it’s difficult to switch gears!

*If any information is misrepresented or factually incorrect please leave a comment and let me know!*
