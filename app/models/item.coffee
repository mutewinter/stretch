attr = DS.attr

module.exports = App.Item = DS.Model.extend
  title: attr('string')
  status: attr('string')
  score: attr('string')
  number: attr('string')
  archived: attr('boolean')
  type: attr('string')

  product: DS.belongsTo('product')

  sizeWeight: (->
    switch @get('score')
      when 'S' then 0
      when 'M' then 1
      when 'L' then 2
      when 'XL' then 3
      else 5
  ).property('score')

  sprintlyUrl: (->
    "https://sprint.ly/product/#{@get('product.id')}/#!/item/#{@get('number')}"
  ).property('number', 'product.id')

  rowClass: (->
    switch @get('type')
      when 'story'  then 'success'
      when 'defect' then 'danger'
      when 'test'   then 'info'
  ).property('type')

App.Item.FIXTURES = [
  {
    id: '1-1'
    title: 'As a herp derp I want to derp herp so that I can derp derp.'
    status: 'someday'
    score: 'M'
    number: '1'
    archived: false
    type: 'story'
    product: 1
  }
  {
    id: '1-2'
    title: 'As a herp derp I want to derp herp so that I can derp derp.'
    status: 'someday'
    score: 'M'
    number: '2'
    archived: false
    type: 'task'
    product: 1
  }
  {
    id: '1-3'
    title: 'Fix the herp showing instead of derp'
    status: 'backlog'
    score: 'M'
    number: '3'
    archived: false
    type: 'defect'
    product: 1
  }
  {
    id: '1-4'
    title: 'Test that herp does not derp'
    status: 'current'
    score: 'M'
    number: '4'
    archived: false
    type: 'test'
    product: 1
  }
]

#   [
#     {
#         "status": "backlog",
#         "product": {
#             "archived": false,
#             "id": 1,
#             "name": "sprint.ly"
#         },
#         "progress": {
#             "accepted_at": "2013-06-14T22:52:07+00:00",
#             "closed_at": "2013-06-14T21:53:43+00:00",
#             "started_at": "2013-06-14T21:50:36+00:00"
#         },
#         "description": "Require people to estimate the score of an item
#         before they can start working on it.",
#         "tags": [
#             "scoring",
#             "backlog"
#         ],
#         "number": 188,
#         "archived": false,
#         "title": "Don't let un-scored items out of the backlog.",
#         "created_by": {
#             "first_name": "Joe",
#             "last_name": "Stump",
#             "id": 1,
#             "email": "joe@joestump.net"
#         },
#         "score": "M",
#         "assigned_to": {
#             "first_name": "Joe",
#             "last_name": "Stump",
#             "id": 1,
#             "email": "joe@joestump.net"
#         },
#         "type": "task"
#     },
#     {
#         "status": "accepted",
#         "product": {
#             "archived": false,
#             "id": 1,
#             "name": "sprint.ly"
#         },
#         "progress": {
#             "accepted_at": "2013-06-14T22:52:07+00:00",
#             "closed_at": "2013-06-14T21:53:43+00:00",
#             "started_at": "2013-06-14T21:50:36+00:00"
#         },
#         "description": "",
#         "tags": [
#             "scoring",
#             "backlog"
#         ],
#         "number": 208,
#         "archived": false,
#         "title": "Add the ability to reply to comments via email.",
#         "created_by": {
#             "first_name": "Joe",
#             "last_name": "Stump",
#             "id": 1,
#             "email": "joe@joestump.net"
#         },
#         "score": "M",
#         "assigned_to": {
#             "first_name": "Joe",
#             "last_name": "Stump",
#             "id": 1,
#             "email": "joe@joestump.net"
#         },
#         "type": "task"
#     }
# ]
