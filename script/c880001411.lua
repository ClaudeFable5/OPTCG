-- AUTO-GENERATED: OP11-077 / 랜돌프
-- rules_id=OP11-077 script_id=880001411 fingerprint=1376ca93a694893784c4d97dc7c9e5e94636aee5f91944ada288fe5274b4cb60
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              filter={
                trait=[[빅 맘 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 다음 상대의 턴 종료 시까지, 자신의 《빅 맘 해적단》 특징을 가진 캐릭터 1장까지의 코스트 +2.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-077]],
    schema_version=1,
  })
end
