-- AUTO-GENERATED: OP05-087 / 하쿠바
-- rules_id=OP05-087 script_id=880000700 fingerprint=043e97377ba93762c7b9044431ec712e9b8cd389226266c5a31caa2e911e0ee9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-5,
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
        costs={
          {
            count=1,
            op=[[KO_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】이 캐릭터 이외의 자신의 캐릭터 1장을 KO 시킬 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -5.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-087]],
    schema_version=1,
  })
end
