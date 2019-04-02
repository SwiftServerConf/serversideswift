import AdminPanel
import Reset

struct Endpoint {
    enum API {}
    enum Backend {}
}

// MARK: API

extension Endpoint.API {
    private static let api = "/api"

    enum Users {
        private static let users = api + "/users"
        static let login = users + "/login"
        static let me = users + "/me"
        static let register = users
        static let token = users + "/token"
        static let update = users + "/me"

        enum ResetPassword {
            private static let resetPassword = users + "/reset-password"
            static let request = resetPassword + "/request"
            static let renderReset = resetPassword
            static let reset = resetPassword
        }
    }
}

// MARK: Backend

extension Endpoint.Backend {
    private static let backend = "/admin"
    // Add your backend endpoints here
}

// MARK: Reset

extension ResetEndpoints {
    static var apiPrefixed: ResetEndpoints {
        return .init(
            resetPasswordRequest: Endpoint.API.Users.ResetPassword.request,
            renderResetPassword: Endpoint.API.Users.ResetPassword.renderReset,
            resetPassword: Endpoint.API.Users.ResetPassword.reset
        )
    }
}
