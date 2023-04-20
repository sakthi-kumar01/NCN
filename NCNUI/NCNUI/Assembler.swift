//
//  Assembler.swift
//  NCNUI
// f
//  Created by raja-16327 on 13/03/23.
//

import Foundation
import NCN_BackEnd
class Assembler {
    static func getUserLoginView(userName: String, password: String, router: UserLoginRouterContract?) -> UserLoginView {
        let usecase = getUserLoginUsecase()
        let presenter = UserLoginPresenter(userLogin: usecase)
        presenter.router = router
        let view = UserLoginView(userName: userName, password: password, presenter: presenter)

        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func createAvailableServiceView(serviceId: Int, serviceTitle: String, serviceDescription: String, router _: CreateAvailableServiceRouterContract?) -> CreateAvailableServiceView {
        let usecase = getCreateAvailableServiceUsecase()
        let presenter = CreateAvailableServicesPresenter(createAvailableService: usecase)

        let view = CreateAvailableServiceView(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription, presenter: presenter)

        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getViewServiceView(router _: ViewServiceRouterContract?) -> ViewServiceView {
        print("View func called")
        let useCase = getViewServiceUseCase()
        let presenter = ViewServicePresenter(viewService: useCase)
        let view = ViewServiceView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getAddNewUserView(router _: AddNewUserRouterContract?) -> AddNewUserView {
        let usecase = getAddNewUserUsecase()
        let presenter = AddNewUserPresenter(addUNewUser: usecase)
        let view = AddNewUserView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getAddNewEmployeeView(router _: AddNewEmployeeRouterContract?) -> AddNewEmployeeView {
        let usecase = getAddNewEmployeeUseCase()
        let presenter = AddNewEmployeePresenter(addNewEmployee: usecase)
        let view = AddNewEmployeeView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getCreateAvailableSubscriptionView(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscritptionDayLimit: Int, serviceId: Int, router _: CreateAvailableSubscriptionRouterContract) -> CreateAvailableSubscriptionView {
        let usecase = getCreateavailableSubscription()
        let presenter = CreateAvailableSubscriptionPresenter(createAvailableSubscription: usecase)
        let view = CreateAvailableSubscriptionView(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionCountLimit: subscriptionCountLimit, subscritptionDayLimit: subscritptionDayLimit, serviceId: serviceId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getViewSubscriptionView() -> ViewSubscriptionView {
        let usecase = getViewSubscriptionUsecase()
        let presenter = ViewSubscriptionPresenter(viewSubscription: usecase)
        let view = ViewSubscriptionView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getCreateQueryView(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, enterpriseId: Int, userId: Int, employeeId: Int, router _: CreateQueryRouterContract?) -> CreateQueryView {
        let usecase = getCreateQueryUsecase()
        let presenter = CreateQueryPresenter(createQuery: usecase)
        let view = CreateQueryView(queryId: queryId, queryType: queryType, queryMessage: queryMessage, queryDate: queryDate, enterpriseId: enterpriseId, userId: userId, employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }

    static func getBuyServiceView(userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, enterpriseId: Int, router _: BuyServiceRouterContract?) -> BuyServiceView {
        let usecase = getBuyService()
        let presenter = BuyServicePresenter(buyService: usecase)
        let view = BuyServiceView(enterpriseId: enterpriseId, userId: userId, employeeId: employeeId, serviceId: serviceId, subscriptionId: subscriptionId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    static func getModifyAvaialableService(serviceId: Int, serviceTitle: String, serviceDescription: String) -> ModifyAvailableServiceView {
        let usecase = getModifyAvailableServiceUsecase()
        let presenter = ModifyAvailableServicePresenter(modifyAvailableService: usecase)
        let view = ModifyAvailableServiceView(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    static func getAssignQueryView(employeeId: Int, queryId: Int) -> AssignQueryView {
        let usecase = getAssignQueryUsecase()
        let presenter = AssignQueryPresenter(assignQuery: usecase)
        let view = AssignQueryView(employeeId: employeeId, queryId: queryId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getCreateavaialabaleSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float,subscritptionDayLimit: Int, serviceId: Int ) -> CreateAvailableSubscriptionView {
        let usecase = getCreateAvaialableSubscription()
        let presenter = CreateAvailableSubscriptionPresenter(createAvailableSubscription: usecase)
        let view = CreateAvailableSubscriptionView(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionCountLimit: subscriptionCountLimit, subscritptionDayLimit: subscriptionId, serviceId: serviceId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
        
    }
    private static func getCreateAvaialableSubscription() -> CreateAvailableSubscription {
        let database = CreateAvailableSubscriptionDatabaseService()
        let datamanager = CreateAvailableSusbscriptionDataManager(databaseService: database)
        let useCase = CreateAvailableSubscription(datamanager: datamanager)
        return useCase
    }
    private static func getSetEnterpriseName() -> SetEnterpriseName{
        let database = SetEnterpriseDatabase()
        let dataManager = SetEnterpriseNameDataManager(database: database)
        let useCase = SetEnterpriseName(dataManager: dataManager)
        return useCase
    }
    static func getSetEnterpriseView(enterpriseName: String) -> SetEnterpriseNameView {
        let usecase = getSetEnterpriseName()
        let presenter = SetEnterpriseNamePresenter(setEnterpriseName: usecase)
        let view = SetEnterpriseNameView(enterpriseName: enterpriseName, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getRemoveAvailableServiceView(serviceId: Int) -> RemoveAvailableServiceView {
        let usecase = getRemoveAvailableService()
        let presenter = RemoveAvailableServicePresenter(removeAvailableService: usecase)
        let view = RemoveAvailableServiceView(serviceId: serviceId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getCreateAvailableServiceView(serviceId: Int) -> CreateAvailableServiceView {
        let usecase = getCreateAvailableService()
        let presenter = CreateAvailableServicesPresenter(createAvailableService: usecase)
        let view = CreateAvailableServiceView(serviceId: serviceId, serviceTitle: "random", serviceDescription: "random", presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    
    
    static func getSearchClientView(userId:Int, employeeId: Int) -> SearchClientView {
        let usecase = getSearchClientUsecase()
        let presenter = SearchClientPresenter(searchClient: usecase)
        let view = SearchClientView(userId: userId,employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    static func getSearchEmployeeView( employeeId: Int) -> SearchEmployeeView {
        let usecase = getSearchEmployeeUsecase()
        let presenter = SearchEmployeePresenter(searchEmployee: usecase)
        let view = SearchEmployeeView(employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static func getViewEmployeeClient(employeeId: Int) -> ViewEmployeeClientView{
        let usecase = getViewEmployeeClientUsecase()
        let presenter = ViewEmployeeClientPresenter(ViewEmployeeClient: usecase)
        let view = ViewEmployeeClientView(employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static func getViewAdminClient(employeeId: Int) -> ViewAdminClientView{
        let usecase = getViewAdminClientUsecase()
        let presenter = ViewAdminClientPresenter(ViewAdminClient: usecase)
        let view = ViewAdminClientView(employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    
    static func getAModifyUserDetailsView(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) -> ModifyUserDetailsView{
        let usecase = getModifyUserDetailsUsecase()
        let presenter = ModifyUserDetailsPresenter(modifyUserDetails: usecase)
        let view = ModifyUserDetailsView(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static func getAModifyEmployeeDetailsView(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) -> ModifyEmployeeDetailsView{
        let usecase = getModifyEmployeeDetailsUsecase()
        let presenter = ModifyEmployeeDetailsPresenter(modifyEmployeeDetails: usecase)
        let view = ModifyEmployeeDetailsView(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static func getModifyAvailableSubscriptionDetailsView(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int) -> ModifyAvailableSubscriptionView{
        let usecase = getModifyAvailableSubscriptionDetailsUsecase()
        let presenter = ModifyAvailableSubscriptionPresenter(modifyAvailableSubscription: usecase)
        let view = ModifyAvailableSubscriptionView(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionCountLimit: subscriptionCountLimit, subscriptionDayLimit: subscriptionDayLimit, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static func getDeleteExpiredServiceView() -> DeleteExpiredServiceView {
        let usecase = getDeleteExpiredService()
        let presenter = DeleteExpiredServicePresenter(deleteExpiredService: usecase)
        let view = DeleteExpiredServiceView( presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getViewExpiredServiceView(employeeId: Int) -> ViewExpiredServiceView {
        let usecase = getViewExpiredService()
        let presenter = ViewExpiredServicePresenter(viewExpiredService: usecase)
        let view = ViewExpiredServiceView( employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getAssignQueryStatusView(queryId: Int) -> AssignQueryStatusView {
        let usecase = getAssignQueryStatus()
        let presenter = AssignQueryStatusPresenter(assignQueryStatus: usecase)
        let view = AssignQueryStatusView( queryId: queryId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getTrackServiceView(id: Int, subscriptionUsage:Int, employeeId: Int) -> TrackServiceView{
        let usecase = getTrackServiceStatus()
        let presenter = TrackServicePresenter(trackService: usecase)
        let view = TrackServiceView(id: id, subscriptionUsage: subscriptionUsage, employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getClientTrackServiceView(id: Int, subscriptionUsage:Int, userId: Int) -> ClientTrackServiceView{
        let usecase = getClientTrackServiceStatus()
        let presenter = ClientTrackServicePresenter(ClientTrackService: usecase)
        let view = ClientTrackServiceView(id: id, subscriptionUsage: subscriptionUsage, userId: userId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getTrackQueryView(employeeId: Int) -> TrackQueryView{
        let usecase = getTrackQuery()
        let presenter = TrackQueryPresenter(trackQuery: usecase)
        let view = TrackQueryView(employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    static func getViewEmployeeQueryView(employeeId: Int) -> ViewEmployeeQueryView{
        let usecase = getViewEmployeeQuery()
        let presenter = ViewEmployeeQueryPresenter(ViewEmployeeQuery: usecase)
        let view = ViewEmployeeQueryView(employeeId: employeeId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    static func getViewUserQueryView(userId: Int) -> ViewUserQueryView{
        let usecase = getViewUserQuery()
        let presenter = ViewUserQueryPresenter(ViewUserQuery: usecase)
        let view = ViewUserQueryView(userId: userId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    static func getDeletQueryView(queryId: Int) -> DeleteQueryView {
        let usecase = getDeleteQuery()
        let presenter = DeleteQueryPresenter(deleteQuery: usecase)
        let view = DeleteQueryView(queryId: queryId, presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
        
    }
    
    private static func getDeleteQuery() -> DeleteQuery {
        let database = DeleteQueryDatabaseService()
        let datamanager = DeleteQueryDataManager(databaseService: database)
        let usecase = DeleteQuery(dataManager: datamanager)
        return usecase
    }
    
    
    private static func getViewUserQuery()-> ViewUserQuery {
        let database = ViewUserQueryDatabaseService()
        let datamanager = ViewUserQueryDataManager(databaseService: database)
        let usecase = ViewUserQuery(dataManager: datamanager)
        return usecase
    }
    private static func getViewEmployeeQuery()-> ViewEmployeeQuery {
        let database = ViewEmployeeQueryDatabaseService()
        let datamanager = ViewEmployeeQueryDataManager(databaseService: database)
        let usecase = ViewEmployeeQuery(dataManager: datamanager)
        return usecase
    }
    private static func getTrackQuery()-> TrackQuery {
        let database = TrackQueryDatabasService()
        let datamanager = TrackQueryDataManager(databaseService: database)
        let usecase = TrackQuery(dataManager: datamanager)
        return usecase
    }
    
    private static func getClientTrackServiceStatus()-> ClientTrackService {
        let database = ClientTrackServiceDatabaseService()
        let datamanager = ClientTrackServiceDataManager(databaseService: database)
        let usecase = ClientTrackService(dataManager: datamanager)
        return usecase
    }
    
    private static func getTrackServiceStatus()-> TrackService {
        let database = TrackServiceDatabaseService()
        let datamanager = TrackServiceDataManager(databaseService: database)
        let usecase = TrackService(dataManager: datamanager)
        return usecase
    }
    
    private static func getAssignQueryStatus() -> AssignQueryStatus{
        let database = AssignQueryStatusDatabaseService()
        let datamanager = AssignQueryStatusDataManager(databaseService: database)
        let usecase = AssignQueryStatus(dataManager: datamanager)
        return usecase
    }
    
    private static func getViewExpiredService() -> ViewExpiredService {
        let database = ViewExpiredServiceDatabaseService()
        let datamanager = ViewExpiredServiceDataManager(databaseService: database)
        let usecase = ViewExpiredService(dataManager: datamanager)
        return usecase
    }
    private static func getDeleteExpiredService() -> DeleteExpiredService {
        let database = DeleteExpiredServiceDatabaseService()
        let datamanager = DeleteExpiredServiceDataManager(databaseService: database)
        let usecase = DeleteExpiredService(dataManager: datamanager)
        return usecase
    }
    private static func getModifyAvailableSubscriptionDetailsUsecase() -> ModifyAvailableSubscription{
        let database = ModifyAvailableSubscriptionDatabaseService()
        let datamanager = ModifyAvailableSubscriptionDataManager(databaseService: database)
        let usecase = ModifyAvailableSubscription(dataManager: datamanager)
        return usecase
    }
    
    private static func getModifyUserDetailsUsecase() -> ModifyUserDetails{
        let database = ModifyUserDetailsDatabaseService()
        let datamanager = ModifyUserDetailsDataManager(databaseService: database)
        let usecase = ModifyUserDetails(dataManager: datamanager)
        return usecase
    }
    private static func getModifyEmployeeDetailsUsecase() -> ModifyEmployeeDetails{
        let database = ModifyEmployeeDetailsDatabaseService()
        let datamanager = ModifyEmployeeDetailsDataManager(databaseService: database)
        let usecase = ModifyEmployeeDetails(dataManager: datamanager)
        return usecase
    }
    
    private static func getViewAdminClientUsecase() -> ViewAdminClient{
        let database = ViewAdminClientDatabaseService()
        let datamanager = ViewAdminClientDataManager(databaseService: database)
        let usecase = ViewAdminClient(dataManager: datamanager)
        return usecase
    }
    
    private static func getViewEmployeeClientUsecase() -> ViewEmployeeClient{
        let database = ViewEmployeeClientDatabaseService()
        let datamanager = ViewEmployeeClientDataManager(databaseService: database)
        let usecase = ViewEmployeeClient(dataManager: datamanager)
        return usecase
    }
    
    
    private static func getSearchEmployeeUsecase() -> SearchEmployee {
        let database = SearchEmployeeDatabaseService()
        let datamanager = SearchEmployeeDataManager(databaseService: database)
        let usecase = SearchEmployee(dataManager: datamanager)
        return usecase
    }
    
    private static func getSearchClientUsecase() -> SearchClient {
        let database = SearchClientDatabaseSevice()
        let datamanager = SearchClientDataManager(databaseService: database)
        let usecase = SearchClient(dataManager: datamanager)
        return usecase
    }
    
    private static func getCreateAvailableService() -> CreateAvailableService {
        let database = CreateAvailableServicesDatabase()
        let datamanager = CreateAvaialableServicesDataManager(database: database  )
        let usecase = CreateAvailableService(datamanager: datamanager)
        return usecase
    }
    private static func getRemoveAvailableService() -> RemoveAvailableService{
        let database = RemoveAvailableServiceDatabaseService()
        let dataManager = RemoveAvailableServiceDataManager(databaseService: database)
        let useCase = RemoveAvailableService(dataManager: dataManager)
        return useCase
    }
    
    
    private static func getAssignQueryUsecase() -> AssignQuery {
        let database = AssignQueryDatabaseService()
        let dataManager = AssignQueryDataManager(databaseService: database)
        let useCase = AssignQuery(dataManager: dataManager)
        return useCase

    }
    
    private static func getModifyAvailableServiceUsecase() -> ModifyAvailableService {
        let database = ModifyAvailableServiceDatabaseService()
        let dataManager = ModifyAvailableServiceDataManager(databaseService: database)
        let useCase = ModifyAvailableService(dataManager: dataManager)
        return useCase
    }
    private static func getCreateAvailableServiceUsecase() -> CreateAvailableService {
        let database = CreateAvailableServicesDatabase()
        let dataManager = CreateAvaialableServicesDataManager(database: database)
        let useCase = CreateAvailableService(datamanager: dataManager)
        return useCase
    }

    private static func getUserLoginUsecase() -> UserLogin {
        let database = UserLoginDatabase()

        let dataManager = UserLoginDataManager(dataBase: database)
        let useCase = UserLogin(dataManager: dataManager)
        return useCase
    }

    private static func getViewServiceUseCase() -> ViewService {
        let database = ViewServiceDatabase()
        let datamanager = ViewServiceDataManager(database: database)
        let useCase = ViewService(dataManager: datamanager)
        return useCase
    }

    private static func getAddNewUserUsecase() -> AddNewUser {
        let database = AddNewUserDatabase()
        let datamanager = AddNewUserDataManager(dataBase: database)
        let usecase = AddNewUser(dataManager: datamanager)
        return usecase
    }

    private static func getAddNewEmployeeUseCase() -> AddNewEmployee {
        let databaseService = AddNewEmployeeDatabase()
        let datamanger = AddNewEmployeeDatamanger(databaseService: databaseService)
        let usecase = AddNewEmployee(datamanger: datamanger)
        return usecase
    }

    public static func getCreateavailableSubscription() -> CreateAvailableSubscription {
        let database = CreateAvailableSubscriptionDatabaseService()
        let datamanager = CreateAvailableSusbscriptionDataManager(databaseService: database)
        let usecase = CreateAvailableSubscription(datamanager: datamanager)

        return usecase
    }

    private static func getViewSubscriptionUsecase() -> ViewSubscription {
        let database = ViewSubscriptionDatabaseService()
        let datamanager = ViewSubscriptionDatamanager(databaseService: database)
        let usecase = ViewSubscription(datamanger: datamanager)
        return usecase
    }

    private static func getCreateQueryUsecase() -> CreateQuery {
        let database = CreateQueryDatabaseService()
        let datamanger = CreateQueryDatamanager(databaseService: database)
        let usecase = CreateQuery(datamanger: datamanger)
        return usecase
    }

    private static func getBuyService() -> BuyService {
        let database = BuyServiceDatabaseService()
        let datamanager = BuyServiceDataManager(databaseService: database)
        let usecase = BuyService(datamanager: datamanager)
        return usecase
    }
}
