# Just a basic function for parsing youtube's transcript json structure, extracting text nodes
# function youtube-transcript
#     jq -r '
#         .actions[]?
#         .updateEngagementPanelAction?
#         .content.transcriptRenderer?
#         .content.transcriptSearchPanelRenderer?
#         .body.transcriptSegmentListRenderer?
#         .initialSegments[]?
#         .transcriptSegmentRenderer?
#         .snippet.runs[]?
#         .text
#     ' $argv
# end
#

function youtube-transcript --description "Extract text from YouTube transcript JSON"
    jq -r '
        .. | objects |
        if .transcriptSegmentRenderer? then
            .transcriptSegmentRenderer.snippet.runs
            | map(.text)
            | join("")
        elif .transcriptSegmentViewModel? then
            .transcriptSegmentViewModel.simpleText
        else
            empty
        end
    ' $argv
end
