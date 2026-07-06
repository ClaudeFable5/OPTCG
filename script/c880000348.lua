-- AUTO-GENERATED: OP02-103 / 센고쿠
-- rules_id=OP02-103 script_id=880000348 fingerprint=9e94be0ef98a36222a73b40f30ca0e910af71a6cbe3dac244e1daa71d6039013
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
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
        source_text=[[【두웅!!×1】【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-103]],
    schema_version=1,
  })
end
