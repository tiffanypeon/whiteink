@WI.module "NoteApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "note/list/list_layout"

		regions:
			newRegion:		"#new-region"
			notesRegion:  "#notes-region"
			panelRegion:  "#panel-region"


	class List.Panel extends App.Views.ItemView
		template: "note/list/_panel"

		triggers:
			"click #new-note" : "new:note:button:clicked"

	class List.Note extends App.Views.ItemView
		template: "note/list/_note"
		tagName: "li"

		# triggers:
		# 	"click .ticket-delete button" : "ticket:delete:clicked"
		# 	"click" 										  : "ticket:member:clicked"

	class List.Empty extends App.Views.ItemView
		template: "note/list/_empty"
		tagName:  "li"

	class List.Notes extends App.Views.CompositeView
		template: "note/list/_notes"
		itemView: List.Note
		emptyView: List.Empty
		itemViewContainer: "ul"
