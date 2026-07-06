-- AUTO-GENERATED: OP07-019 / 쥬얼리 보니
-- rules_id=OP07-019@112bd586c4e2 script_id=880000873 fingerprint=112bd586c4e2dd4c06fe7a0ee768d933fd22739cf4a2355156663cd40d7b4a86
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】 자신의 두웅!! 1장을 레스트할 수 있다: 상대의 리더 또는 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-019@112bd586c4e2]],
    schema_version=1,
  })
end
