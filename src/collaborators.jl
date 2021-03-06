
# Interface -------

function collaborators(owner, repo; auth = AnonymousAuth(), options...)
    collaborators(auth, owner, repo; options...)
end

function collaborators(auth::Authorization, owner, repo; headers = Dict(), options...)
    authenticate_headers(headers, auth)
    r = get(URI(API_ENDPOINT; path = "/repos/$owner/$repo/collaborators");
            headers = headers,
            options...)

    handle_error(r)

    data = JSON.parse(r.data)
    map!( u -> User(u), data)
end


function iscollaborator(owner, repo, user; auth = AnonymousAuth(), options...)
    iscollaborator(auth, owner, repo, user; options...)
end

function iscollaborator(auth::Authorization, owner, repo, user; headers = Dict(), options...)
    authenticate_headers(headers, auth)
    r = get(URI(API_ENDPOINT; path = "/repos/$owner/$repo/collaborators/$user");
            headers = headers,
            options...)

    r.status == 204 && return true
    r.status == 404 && return false

    handle_error(r)  # 404 is not an error in this case

    return false  # at this point, assume no
end


function add_collaborator(owner, repo, user; auth = AnonymousAuth(), options...)
    add_collaborator(auth, owner, repo, user; options...)
end

function add_collaborator(auth::Authorization, owner, repo, user; headers = Dict(), options...)
    authenticate_headers(headers, auth)
    r = put(URI(API_ENDPOINT; path = "/repos/$owner/$repo/collaborators/$user");
            headers = headers,
            options...)

    handle_error(r)
end


function remove_collaborator(owner, repo, user; auth = AnonymousAuth(), options...)
    remove_collaborator(auth, owner, repo, user; options...)
end

function remove_collaborator(auth::Authorization, owner, repo, user; headers = Dict(), options...)
    authenticate_headers(headers, auth)
    r = delete(URI(API_ENDPOINT; path = "/repos/$owner/$repo/collaborators/$user");
            headers = headers,
            options...)

    handle_error(r)
end
