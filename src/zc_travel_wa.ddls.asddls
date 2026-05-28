@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projeção para viagem'
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_WA
  provider contract transactional_query
  as projection on ZI_TRAVEL_WA
{
  key ViagemID,
  @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
  @ObjectModel.text.element: ['NomeAgencia']
  @Search.defaultSearchElement: true
  AgenciaID,
  _Agencia.Name     as NomeAgencia, 
  @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
  @ObjectModel.text.element: ['NomeCliente']
  @Search.defaultSearchElement: true
  ClienteID,
  _Cliente.LastName as NomeCliente,
  DataInicio,
  DataFim,
  @Semantics.amount.currencyCode: 'CodigoMoeda'
  TaxaReserva,
  @Semantics.amount.currencyCode: 'CodigoMoeda'
  PrecoTotal,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
  CodigoMoeda,
  Descricao,
  StatusViagem,
  UltimaModificacaoEm,
  UltimaModificacaoEmLocal,

  /* Associations */
  _Agencia,
  _Cliente
}
