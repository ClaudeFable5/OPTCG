-- AUTO-GENERATED: OP07-019 / 쥬얼리 보니
-- rules_id=OP07-019 script_id=880000872 fingerprint=517e38c613ed5e441b5208f06625041942b0415e996b6887661b09df329f07bb
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
        source_text=[[【상대의 어택 시】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 상대의 리더 또는 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-019]],
    schema_version=1,
  })
end
