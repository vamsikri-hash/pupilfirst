type community = {
  communityName: string,
  communityId: string,
}

type t = {
  id: string,
  name: string,
  review: bool,
  author: bool,
  enableLeaderboard: bool,
  description: string,
  exited: bool,
  thumbnailUrl: option<string>,
  linkedCommunities: array<community>,
  accessEnded: bool,
  ended: bool,
}

let name = t => t.name
let id = t => t.id
let review = t => t.review
let author = t => t.author
let description = t => t.description
let exited = t => t.exited
let thumbnailUrl = t => t.thumbnailUrl
let linkedCommunities = t => t.linkedCommunities
let accessEnded = t => t.accessEnded
let ended = t => t.ended
let enableLeaderboard = t => t.enableLeaderboard

let decodeCommunity = json => {
  open Json.Decode
  {
    communityId: field("id", string, json),
    communityName: field("name", string, json),
  }
}

let decode = json => {
  open Json.Decode
  {
    id: field("id", string, json),
    name: field("name", string, json),
    description: field("description", string, json),
    exited: field("exited", bool, json),
    review: field("review", bool, json),
    author: field("author", bool, json),
    enableLeaderboard: field("enableLeaderboard", bool, json),
    thumbnailUrl: field("thumbnailUrl", nullable(string), json)->Js.Null.toOption,
    linkedCommunities: field("linkedCommunities", array(decodeCommunity), json),
    accessEnded: field("accessEnded", bool, json),
    ended: field("ended", bool, json),
  }
}
