videos = [
        id: '1',
        name: 'Dynamo'
      ,
        id: '2',
        name: 'Dynamo Ember'
      ,
        id: '3',
        name: 'Apprentice'
      ,
        id: '4',
        name: "All About Gen"
    ]

ElixirCasts.Router.map ->
  @resource 'videos', path: '/', ->
    @resource "video", path: 'video/:video_id'

ElixirCasts.VideoRoute = Ember.Route.extend
  model: (params) ->
    videos.filter((item, _index, self) ->
      item.id == params.video_id
    )[0]

ElixirCasts.VideosIndexRoute = Ember.Route.extend
  model: ->
    videos

