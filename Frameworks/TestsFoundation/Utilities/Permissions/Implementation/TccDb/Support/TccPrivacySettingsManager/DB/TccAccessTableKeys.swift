import SQLite

final class TccAccessTableKeys {
    let service = Expression<String>("service")
    let client = Expression<String>("client")
    let clientType = Expression<Int>("client_type")
    let allowed = Expression<Int>("auth_value")
    let authReason = Expression<Int>("auth_reason")
    let authVersion = Expression<Int>("auth_version")
    let csreq = Expression<SQLite.Blob?>("csreq")
    let policyId = Expression<Int?>("policy_id")
}
