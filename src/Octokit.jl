
module Octokit

import Base.show

using Requests
using JSON
using HttpCommon


export User,
       Organization,
       Repo,
       HttpError,
       AuthException


export authenticate,
       set_api_endpoint,
       set_web_endpoint,
       user,
       star,
       unstar,
       stargazers,
       starred,
       forks,
       fork,
       contributors,
       commit_activity,
       code_frequency,
       participation,
       punch_card,
       collaborators,
       iscollaborator,
       add_collaborator,
       remove_collaborator,
       watchers,
       watched,
       watching,
       watch,
       unwatch,
       followers,
       following,
       org,
       orgs,
       repo


include("utils.jl")
include("endpoint.jl")
include("error.jl")
include("auth.jl")
include("user.jl")
include("organizations.jl")
include("repo.jl")
include("starring.jl")
include("forks.jl")
include("statistics.jl")
include("collaborators.jl")
include("watching.jl")


end

