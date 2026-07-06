-- AUTO-GENERATED: OP05-014 / 페루
-- rules_id=OP05-014 script_id=880000626 fingerprint=284fff8576060613b49e10fbc29498bc902cb3f6c3bf13b575479fbcb8e11dbc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-014]],
    schema_version=1,
  })
end
