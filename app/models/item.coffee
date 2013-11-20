attr = DS.attr

module.exports = App.Item = DS.Model.extend
  title: attr('string')
  status: attr('string')
  score: attr('string')
  archived: attr('boolean')

  product: DS.belongsTo('product')

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
