from .models import SubPrimaryNavigation, PrimaryNavigation

def show_pages_menu(context):
    formBulderData=[]
    fields = PrimaryNavigation.objects.filter(is_published=True)
    data = [{'id': fld.pk, 'title': fld.title,'link_type':fld.link_type,'page':fld.page,'link':fld.link} for fld in fields]
    for fld in data:
        fieldData={}
        fieldID=fld['id']
        fieldscho = SubPrimaryNavigation.objects.filter(parent=str(fieldID), is_published=True)
        fieldData['submenu']=fieldscho.values()
        fieldData['field']=fld
        formBulderData.append(fieldData)
    return {'pages_menu': formBulderData}
