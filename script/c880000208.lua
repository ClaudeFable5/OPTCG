-- AUTO-GENERATED: OP01-085 / Mr.3 (갤디노)
-- rules_id=OP01-085 script_id=880000208 fingerprint=b261a3c50edf40fa6f5e88929d46fa3e8d8ebd3dcc0b0fafdbef27a52c538a35
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《바로크 워크스》 특징을 가진 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 선택한다. 다음 상대 턴 종료 시까지, 선택한 캐릭터는 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-085]],
    schema_version=1,
  })
end
