-- AUTO-GENERATED: OP14-087 / 미스 발렌타인(미키타)
-- rules_id=OP14-087 script_id=880002252 fingerprint=96ceca5e602026fb650aae1c12e79023b577ad3f7488229e01131672e3ba6c06
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[미스 발렌타인(미키타)]],
              trait_contains=[[바로크 워크스]],
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 덱 위에서 4장을 보고, 「미스 발렌타인(미키타)」 이외의 『바로크 워크스』를 포함한 특징을 가진 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-087]],
    schema_version=1,
  })
end
